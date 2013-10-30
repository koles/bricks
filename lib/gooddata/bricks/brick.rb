module Gooddata
  module Bricks

    class Pipeline
      def self.prepare(pipeline)
        pipeline.reverse.reduce(nil) {|memo, app| memo.nil? ? app.new : app.new(memo)}
      end
    end

    class Middleware
      def initialize(app)
        @app = app
      end
      
    end
    
    class Brick

      def name
        self.class
      end

      def version
        fail "Method version should be reimplemented"
      end

      def call(params={})
        fail "Method run should be reimplemented"
      end

    end
    
  end
end
