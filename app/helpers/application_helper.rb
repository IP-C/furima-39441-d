module ApplicationHelper
  def shipping_fee_display(shipping_id)
    case shipping_id
    when 1
      "送料込み（出品者負担）"
    when 2
      "着払い（購入者負担）"
    else
      "" # 未設定の場合、空文字列を返す
    end
  end
end
