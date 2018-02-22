module CodeServices
  class Restart
    def run
      Rails.cache.clear
      # TODO should we run a different set of code run it here on end
    end
  end
end
