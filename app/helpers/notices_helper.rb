module NoticesHelper

  def notice_destroy_and_read_authorize
    render json: "Удялть и читать можно только свои уведомления", status: :unauthorized if @notice.noticable != current_user
  end

end
