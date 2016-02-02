#
# Autogenerated by Thrift Compiler (0.9.3)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'flume_types'

module ThriftFlumeEventServer
  class Client
    include ::Thrift::Client

    def append(evt)
      send_append(evt)
    end

    def send_append(evt)
      send_oneway_message('append', Append_args, :evt => evt)
    end
    def rawAppend(evt)
      send_rawAppend(evt)
    end

    def send_rawAppend(evt)
      send_oneway_message('rawAppend', RawAppend_args, :evt => evt)
    end
    def ackedAppend(evt)
      send_ackedAppend(evt)
      return recv_ackedAppend()
    end

    def send_ackedAppend(evt)
      send_message('ackedAppend', AckedAppend_args, :evt => evt)
    end

    def recv_ackedAppend()
      result = receive_message(AckedAppend_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'ackedAppend failed: unknown result')
    end

    def close()
      send_close()
      recv_close()
    end

    def send_close()
      send_message('close', Close_args)
    end

    def recv_close()
      result = receive_message(Close_result)
      return
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_append(seqid, iprot, oprot)
      args = read_args(iprot, Append_args)
      @handler.append(args.evt)
      return
    end

    def process_rawAppend(seqid, iprot, oprot)
      args = read_args(iprot, RawAppend_args)
      @handler.rawAppend(args.evt)
      return
    end

    def process_ackedAppend(seqid, iprot, oprot)
      args = read_args(iprot, AckedAppend_args)
      result = AckedAppend_result.new()
      result.success = @handler.ackedAppend(args.evt)
      write_result(result, oprot, 'ackedAppend', seqid)
    end

    def process_close(seqid, iprot, oprot)
      args = read_args(iprot, Close_args)
      result = Close_result.new()
      @handler.close()
      write_result(result, oprot, 'close', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Append_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    EVT = 1

    FIELDS = {
      EVT => {:type => ::Thrift::Types::STRUCT, :name => 'evt', :class => ::ThriftFlumeEvent}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Append_result
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class RawAppend_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    EVT = 1

    FIELDS = {
      EVT => {:type => ::Thrift::Types::STRUCT, :name => 'evt', :class => ::RawEvent}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class RawAppend_result
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class AckedAppend_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    EVT = 1

    FIELDS = {
      EVT => {:type => ::Thrift::Types::STRUCT, :name => 'evt', :class => ::ThriftFlumeEvent}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class AckedAppend_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::I32, :name => 'success', :enum_class => ::EventStatus}
    }

    def struct_fields; FIELDS; end

    def validate
      unless @success.nil? || ::EventStatus::VALID_VALUES.include?(@success)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field success!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Close_args
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Close_result
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end
