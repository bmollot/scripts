#!/bin/crystal

music_dir, backup_dirs = "",\
    ["/media/chest/mus/flac", "/media/chest/mus/opus", "/media/chest/mus/mp3"]

class String
    def to_song_name
        self.gsub(/\..*$/, "")
    end
end

Process.run("xdg-user-dir", ["MUSIC"]) do |proc|
    music_dir = proc.output.gets.as(String)
end

backup_dirs.select! &.exists?

abort "No backup directories, quitting. Perhaps the ones entered don't exist?" if backup_dirs.empty?

Dir.foreach(music_dir) do |file|
    next if File.directory?(music_dir + "/" + file)
    filestem = file.to_song_name
    puts "Ensuring #{filestem} is synced"
    backup_dirs.each do |dest|
        puts "Checking #{dest}"
        if !Dir.entries(dest).map{|x| x.to_song_name}.includes?(filestem)
            puts "#{dest} is missing #{filestem}"
            desttype = dest.split('/').last
            infile = music_dir + '/' + file
            outfile = dest + '/' + filestem + '.' + desttype
            codec = case desttype
            when "opus"
                "libopus"
            else
                desttype
            end
            puts "Adding..."
            Process.run("ffmpeg", ["-i", infile, "-acodec", codec, outfile],\
                error: true)
        else
            puts "OK"
        end
    end
end
