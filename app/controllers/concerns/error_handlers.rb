module ErrorHandlers
  extend ActiveSupport::Concern

  # 上記は必ず記述
  # includedメソッド: ブロック内のメソッドは、ErrorHandlersを読み込んだクラスのクラスメソッドとして評価

  included do
    rescue_from StandardError, with: :rescue500 # 親クラスなので先に指定
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end

  def rescue500(e)
    render "errors/internal_server_error", status: 500
  end

  def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
  end

  def rescue404(e)
    render "errors/not_found", status: 404
  end
end
