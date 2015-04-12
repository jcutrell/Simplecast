module Simplecast
  class Client
    module Resource
      include Simplecast::Configurable
      def find(id)
        api_obj = client.get("#{resource_plural_name_lower}/#{id}.json")
        model.new(api_obj)
      end
      def all
        all = client.get("#{resource_plural_name_lower}.json")
        all.map {|item| model.new(item) }
      end
      def resource_plural_name_lower
        send(:name).split('::').last.downcase + "s"
      end
      def client
        @client ||= Simplecast.client
      end
      def model
        Simplecast.const_get(name.split("::").last)
      end
    end
  end
end
