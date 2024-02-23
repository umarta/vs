require 'digest'

class FileContentCounter
  attr_reader :path

  def initialize(path)
    @path = path
    @content_counts = Hash.new { |hash, key| hash[key] = { count: 0, files: [] } }
  end

  def scan
    scan_directory(path)
    save_and_display_results
  end

  private

  def scan_directory(dir)
    Dir.foreach(dir) do |entry|
      next if entry == '.' || entry == '..'

      full_path = File.join(dir, entry)

      if File.directory?(full_path)
        scan_directory(full_path)
      else
        hash = calculate_content_hash(full_path)
        @content_counts[hash][:count] += 1
        @content_counts[hash][:files] << entry
      end
    end
  end

  def calculate_content_hash(file_path)
    sha256 = Digest::SHA256.new
    File.open(file_path, 'rb') do |file|
      buffer = ''
      sha256 << buffer while file.read(4096, buffer)
    end
    sha256.hexdigest
  end

  def save_and_display_results
    sorted_results = @content_counts.sort_by { |_, data| -data[:count] }
    File.open('output.txt', 'w') do |file|
      sorted_results.each do |content_hash, data|
        count = data[:count]
        files = data[:files].join(', ')
        file.puts "#{content_hash} #{count} #{files}"
      end
    end
  end
end

# Usage
folder_path = ARGV[0] || '.'  # Allow passing the folder path as a command-line argument
counter = FileContentCounter.new(folder_path)
counter.scan

# how to run
# ruby scan_file.rb /path/to/folder