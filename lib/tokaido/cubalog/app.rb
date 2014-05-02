# encoding: utf-8

Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = "erb"
Cuba.settings[:render][:views] = File.expand_path(File.join(File.dirname(__FILE__), "../../../app/views"))

Cuba.use Rack::Static,
  root: "public",
  urls: ["/css", "/js", "/images"]

Cuba.define do
  on "logs/:tokaido_app/raw", param("path") do |tokaido_app, path|
    begin
      lines = File.open(File.join(path, "log", "development.log")).map {|l| l.force_encoding('UTF-8')}.map {|l| l.gsub(/\[\d+m/, '')}
    rescue
      lines = ["Couldn't find log file. Check if 'development.log' exists in your app directory."]
    end
    res.write view("raw_logs", {where: :raw, app_name: tokaido_app, path: path, lines: lines})
  end

  on "logs/:tokaido_app", param("path") do |tokaido_app, path|
    begin
      lines = File.open(File.expand_path(File.join(File.dirname(__FILE__), "../../../../", "Firewall", "#{tokaido_app}.tokaido.out"))).map {|l| l}
    rescue
      lines = []
    end
    res.write view("logs", {where: :simple, app_name: tokaido_app, path: path, lines: lines})
  end
end
