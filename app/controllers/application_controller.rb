class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  def not_found
    render 'errors/not_found' , :status => :not_found, layout: 'errors'
  end

  def forbidden
    render 'errors/forbidden' , :status => :forbidden, layout: 'errors'
  end

  def internal_server_error
    render 'errors/internal_server_error', :status => :internal_server_error, layout: 'errors'
  end
end
