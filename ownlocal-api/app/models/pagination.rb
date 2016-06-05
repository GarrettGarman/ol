class Pagination
   @@default_pagesize = 3
   @@default_page_number = 0
   
   @page_number
   @items_per_page
   @first_item
   @last_item  
   
   def initialize(page_number, items_per_page)
        #Do pagination calculations
        @page_number =  page_number ? page_number.to_i : @@default_page_number.to_i
        @items_per_page = items_per_page ? items_per_page.to_i : @@default_pagesize
        @first_item = (@page_number - 1) * @items_per_page
        @last_item = @first_item + (@items_per_page - 1)
   end
   
   def page_number
       @page_number
   end
   
   def items_per_page
       @items_per_page
   end
   
   def first_item
       @first_item
   end
   
   def last_item
       @last_item  
   end
end