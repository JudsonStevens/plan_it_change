module PlanItChange
  module Error
    class UserIsNotAdmin < StandardError

      def http_status
        403
      end

      def code
        'not_an_admin'
      end

      def message
        "User doesn't have sufficient rights"
      end

      def to_hash
        {
          message: message,
          code: code
        }
      end
    end
  end
end
