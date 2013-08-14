class SentencesController < ApplicationController
  def annotate
    @sentence = Sentence.find(params[:id])
    @annotations = @sentence.annotations
  end
end

