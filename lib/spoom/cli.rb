# typed: true
# frozen_string_literal: true

require "thor"

require_relative "cli/commands/config"
require_relative "cli/commands/lsp"

module Spoom
  module Cli
    class Main < Thor
      extend T::Sig

      class_option :no_color, desc: "Don't use colors", type: :boolean

      desc "config", "manage Sorbet config"
      subcommand "config", Spoom::Cli::Commands::Config

      desc "lsp", "send LSP requests to Sorbet"
      subcommand "lsp", Spoom::Cli::Commands::LSP

      # Utils

      def self.exit_on_failure?
        true
      end
    end
  end
end