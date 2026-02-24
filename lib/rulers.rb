# frozen_string_literal: true

# require_relative "rulers/version"
require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      # Hack to handle the favicon.ico requests
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, {"content-type" => "text/html"}, []]
      end

      if env["PATH_INFO"] == "/"
        # env["PATH_INFO"] = "/quotes/a_quote" // this is one approach
        return [302, {"location" => "/quotes/a_quote"}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {"content-type" => "text/html"}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
