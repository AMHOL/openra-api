# frozen_string_literal: true

require 'fileutils'

module Openra
  module API
    module Utils
      class Cache
        MAX_SIZE = 100

        attr_reader :directory, :mutex
        private :directory, :mutex

        def initialize(directory)
          @directory = directory
          @mutex = Mutex.new

          FileUtils.mkdir_p(directory)
        end

        def fetch_or_store(key)
          mutex.synchronize do
            fetch(key) || store(key, yield)
          end
        end

        def clear
          mutex.synchronize do
            files.map { |file| File.delete(file) }
          end
        end

        private

        def fetch(key)
          path = path_for(key)

          File.read(path) if File.exists?(path)
        end

        def store(key, content)
          path = path_for(key)

          File.write(path, content)

          pop if size > MAX_SIZE

          content
        end

        def size
          files.count
        end

        def pop
          File.delete(files.sort_by { |file| File.mtime(file) }.first)
        end

        def files
          Dir.entries(directory).map { |key| path_for(key) }.select do |file|
            File.file?(file)
          end
        end

        def path_for(key)
          File.join(directory, key)
        end
      end
    end
  end
end
