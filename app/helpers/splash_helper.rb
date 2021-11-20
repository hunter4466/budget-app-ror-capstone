module SplashHelper
    def show_svg(path)
        File.open("app/assets/images/Icons/#{path}", "rb") do |file|
          raw file.read
        end
      end
end
