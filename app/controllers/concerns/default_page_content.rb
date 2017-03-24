module DefaultPageContent
  extend ActiveSupport::Concern
  
    included do
      before_filter :set_title_defaults
    end
    
    def set_title_defaults
      @page_title ="DevCamp Portfolio"
      @seo_keywords = "portfolio"
    end
    
end
