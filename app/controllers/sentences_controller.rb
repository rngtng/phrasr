class SentencesController < ApplicationController
  respond_to :html, :xml, :json

  def show
    @sentence = Sentence.find params[:id]
    respond_with @sentence
  end

end
