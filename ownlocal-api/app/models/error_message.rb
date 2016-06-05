class ErrorMessage
   @error_message
   @http_status
   
   def initialize(http_status, error_message)
        @error_message = error_message
        @http_status = http_status
   end
   
   def error_message
      @error_message 
   end
   
   def http_status
      @http_status 
   end
end