class JavascriptsController < ApplicationController
  layout false
  before_filter :js_content_type
 
  def js_content_type
    response.headers['Content-type'] = 'text/javascript; charset=utf-8'
  end
 
  def newton
  end
end