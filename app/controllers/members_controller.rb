class MembersController < ApplicationController

  # 会員一覧画面
  def index
    @members = Member.order("number")
  end
  
  # 会員情報の詳細
  def show
    @member = Member.find(params[:id])
  end

  # 新規作成フォーム
  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
  end

  # 更新フォーム
  def edit
    @member = Member.find(params[:id])
  end

  # 会員の新規登録
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to @member, notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  # 検索
  def search
    @members = Member.search(params[:q])
    render "index"
  end
end
