
module InlineData
  class DB
    def file_lock
      @file.flock(File::LOCK_NB | File::LOCK_EX)
    end

    def initialize(data_store)
      @file = data_store
      @db_pos = @file.pos
      @existed = @db_pos != @file.size
      @data = @existed ? load : nil
      @file.rewind
      @contents = @file.read @db_pos
    end

    def self.default(file)
      if Kernel.const_defined? :DATA
        new Kernel.const_get :DATA
      else
        from file
      end
    end

    def self.from(filename)
      f = File.new filename

      loop do
        line = f.gets
        break if line.nil? || line.chomp == '__END__'
      end

      new f
    end

    attr_accessor :data

    def save
      db_str = dump

      File.open @file.path, 'w+' do |f|
        f.puts @contents
        f.puts '__END__' unless @existed
        f.puts db_str
      end
    end

    def close
      @file.close unless @file.nil? || @file.closed?
    end

    protected

    def load
      raise NotImplementedError
    end

    def dump
      raise NotImplementedError
    end
  end
end
