module CodeServices
  class Process < Default
    def initialize(code)
      @code = code
    end

    def run
      store_to_cache
      codes = fetch_cache
      output = nil
      codes.each do |code|
        eval_code = eval(code)
        output = eval_code if code == @code
      end

      output
    end

    private

    def evil_code?
      # TODO Should implement this to check for
      # bad codes that can down the app
      CodeService::Checker.new(@code).process
    end

    def store_to_cache
      new_cache = fetch_cache.push(@code)
      Rails.cache.fetch('code') { new_cache }
    end

    def fetch_cache
      Rails.cache.fetch('code') || []
    end
  end
end

#
# "
#   def print(a)
#     puts (a)
#   end
# "