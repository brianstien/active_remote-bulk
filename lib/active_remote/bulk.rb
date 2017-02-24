# frozen_string_literal: true
require 'active_remote/bulk/version'

require 'active_remote'
require 'active_remote/bulk/errors'
require 'active_remote/bulk/persistence'

module ActiveRemote
  module Bulk
  end

  class Base
    include ::ActiveRemote::Bulk::Persistence
  end
end
