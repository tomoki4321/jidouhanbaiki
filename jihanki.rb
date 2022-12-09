class VendingMachine

  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    @sales_amount = 0
    @juices=[[{price:120,name:"コーラ"},{price:120,name:"コーラ"},{price:120,name:"コーラ"},{price:120,name:"コーラ"},{price:120,name:"コーラ"}]]
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  def infomation
    @juices.each do|juice|
      puts juice
    end
    puts "コーラの在庫は：#{@juices[0].count}個です"
  end

  def purchase
    if @slot_money <= 120 || @juices[0].empty?
      puts "購入できません"
      puts "残高は#{@slot_money}円です"
    else
      puts "購入しますか？"
      puts "0:購入、１：やめる"
      answer=gets.to_i
      case answer
      when 0
        @sales_amount+=120
        @slot_money-=120
        @juices[0].shift()
        puts "売上は#{@sales_amount}円です"
        puts "残高は#{@slot_money}円です"
      when 1
        return
      end
    end
  end
end

