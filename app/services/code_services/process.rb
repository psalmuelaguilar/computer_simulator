module CodeServices
  class Process < Default
    def initialize(code)
      @code = code
    end

    def run
      output = nil
      store_to_cache
      codes = fetch_cache
      begin
        codes.each do |code|
          eval_code = eval(code)
          output = eval_code if code == @code
        end
      rescue
        pop_cache
        output = 'SYNTAX ERROR!'
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

    def pop_cache
      fetch_cache.pop
      Rails.cache.fetch('code') { fetch_cache }
    end
  end
end

#
# "
#   def print(a)
#     puts (a)
#   end
# "