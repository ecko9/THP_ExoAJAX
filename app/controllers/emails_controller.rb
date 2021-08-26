class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find_by(id: params[:id])
    @indexEmail = Email.all.index(@email)
    @email.update(read: true)
    
    respond_to do |format|
      format.html {redirect_to email_path(@email)}
      format.js {}
    end
  end

  def create
    @email = Email.create(object: Faker::Lorem.sentence(word_count: 3), content: Faker::Lorem.paragraph(sentence_count: 2), read: false)

    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end

  def update
    @email = Email.find_by(id: params[:id])
    @indexEmail = Email.all.index(@email)
    @email.update(read: false)


    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end

  def destroy
    @email = Email.find_by(id: params[:id])
    @indexEmail = Email.all.index(@email)
    @email.destroy

    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end

  private

  def email_params
    params.permit(:object, :content, :read)
  end
end
