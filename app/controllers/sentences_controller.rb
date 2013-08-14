class SentencesController < ApplicationController
  def annotate
    @sentence_id = params[:id]

    @annotations = Sentence.find(@sentence_id).annotations
  end

  def addAnnotation
    @sentence_id = params[:sentence_id]
    @annotations = Sentence.find(@sentence_id).annotations
    @content = params[:content]
    s = Sentence.find(@sentence_id)
    s.annotations << Annotation.create(content: @content)
  end
end

