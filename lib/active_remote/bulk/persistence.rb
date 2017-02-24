# frozen_string_literal: true
require 'active_support/concern'

module ActiveRemote
  module Bulk
    module Persistence
      extend ::ActiveSupport::Concern

      module ClassMethods
        # Create multiple records at the same time. Returns a collection of active
        # remote objects from the passed records. Records that were not created
        # are returned with error messages indicating what went wrong.
        #
        # ====Examples
        #
        #   # A single hash
        #   Tag.create_all({ :name => 'foo' })
        #
        #   # Hashes
        #   Tag.create_all({ :name => 'foo' }, { :name => 'bar' })
        #
        #   # Active remote objects
        #   Tag.create_all(Tag.new(:name => 'foo'), Tag.new(:name => 'bar'))
        #
        #   # Protobuf objects
        #   Tag.create_all(Generic::Remote::Tag.new(:name => 'foo'), Generic::Remote::Tag.new(:name => 'bar'))
        #
        #   # Bulk protobuf object
        #   Tag.create_all(Generic::Remote::Tags.new(:records => [ Generic::Remote::Tag.new(:name => 'foo') ])
        #
        def create_all(*records)
          response = rpc.execute(:create_all, _parse_records(records))

          if response.respond_to?(:records)
            serialize_records(response.records)
          else
            raise ::ActiveRemote::Bulk::InvalidResponse
          end
        end

        # Delete multiple records at the same time. Returns a collection of active
        # remote objects from the passed records. Records that were not deleted
        # are returned with error messages indicating what went wrong.
        #
        # ====Examples
        #
        #   # A single hash
        #   Tag.delete_all({ :guid => 'foo' })
        #
        #   # Hashes
        #   Tag.delete_all({ :guid => 'foo' }, { :guid => 'bar' })
        #
        #   # Active remote objects
        #   Tag.delete_all(Tag.new(:guid => 'foo'), Tag.new(:guid => 'bar'))
        #
        #   # Protobuf objects
        #   Tag.delete_all(Generic::Remote::Tag.new(:guid => 'foo'), Generic::Remote::Tag.new(:guid => 'bar'))
        #
        #   # Bulk protobuf object
        #   Tag.delete_all(Generic::Remote::Tags.new(:records => [ Generic::Remote::Tag.new(:guid => 'foo') ])
        #
        def delete_all(*records)
          response = rpc.execute(:delete_all, _parse_records(records))

          if response.respond_to?(:records)
            serialize_records(response.records)
          else
            raise ::ActiveRemote::Bulk::InvalidResponse
          end
        end

        # Destroy multiple records at the same time. Returns a collection of active
        # remote objects from the passed records. Records that were not destroyed
        # are returned with error messages indicating what went wrong.
        #
        # ====Examples
        #
        #   # A single hash
        #   Tag.destroy_all({ :guid => 'foo' })
        #
        #   # Hashes
        #   Tag.destroy_all({ :guid => 'foo' }, { :guid => 'bar' })
        #
        #   # Active remote objects
        #   Tag.destroy_all(Tag.new(:guid => 'foo'), Tag.new(:guid => 'bar'))
        #
        #   # Protobuf objects
        #   Tag.destroy_all(Generic::Remote::Tag.new(:guid => 'foo'), Generic::Remote::Tag.new(:guid => 'bar'))
        #
        #   # Bulk protobuf object
        #   Tag.destroy_all(Generic::Remote::Tags.new(:records => [ Generic::Remote::Tag.new(:guid => 'foo') ])
        #
        def destroy_all(*records)
          response = rpc.execute(:destroy_all, _parse_records(records))

          if response.respond_to?(:records)
            serialize_records(response.records)
          else
            raise ::ActiveRemote::Bulk::InvalidResponse
          end
        end

        # Update multiple records at the same time. Returns a collection of active
        # remote objects from the passed records. Records that were not updated
        # are returned with error messages indicating what went wrong.
        #
        # ====Examples
        #
        #   # A single hash
        #   Tag.update_all({ :guid => 'foo', :name => 'baz' })
        #
        #   # Hashes
        #   Tag.update_all({ :guid => 'foo', :name => 'baz' }, { :guid => 'bar', :name => 'qux' })
        #
        #   # Active remote objects
        #   Tag.update_all(Tag.new(:guid => 'foo', :name => 'baz'), Tag.new(:guid => 'bar', :name => 'qux'))
        #
        #   # Protobuf objects
        #   Tag.update_all(Generic::Remote::Tag.new(:guid => 'foo', :name => 'baz'), Generic::Remote::Tag.new(:guid => 'bar', :name => 'qux'))
        #
        #   # Bulk protobuf object
        #   Tag.update_all(Generic::Remote::Tags.new(:records => [ Generic::Remote::Tag.new(:guid => 'foo', :name => 'baz') ])
        #
        def update_all(*records)
          response = rpc.execute(:update_all, _parse_records(records))

          if response.respond_to?(:records)
            serialize_records(response.records)
          else
            raise ::ActiveRemote::Bulk::InvalidResponse
          end
        end

        private

        def _parse_records(*records)
          records.flatten!

          if records.first.respond_to?(:attributes)
            records.collect!(&:attributes)
          else
            records.collect!(&:to_hash)
          end

          return records.first if records.first && records.first.key?(:records)

          # If we made it this far, build a bulk-formatted hash.
          { records: records }
        end
      end
    end
  end
end
