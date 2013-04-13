module FeedbackFormsHelper
  def edit_question_field(question)

    id = "questions[#{question.id}]"

    case question.question_type_id
    when FeedbackQuestion::QuestionType.free_text
      text_area_tag(id)

    when FeedbackQuestion::QuestionType.drop_down
      select_tag(id, options_for_select(question.possible_answers_array))

    when FeedbackQuestion::QuestionType.agreement_level
       content_tag(:table, class: "feedback_question_agreement_level") do
         content_tag(:tr) do
           content_tag(:th, "Strongly Disagree") + 
           content_tag(:th, "Disagree") + 
           content_tag(:th, "Neutral") + 
           content_tag(:th, "Agree") + 
           content_tag(:th, "Strongly Agree") + 
           content_tag(:th, "N/A")
         end + 
         content_tag(:tr) do
           content_tag(:td, radio_button_tag(id, "Strongly Disagree")) + 
           content_tag(:td, radio_button_tag(id, "Disagree")) + 
           content_tag(:td, radio_button_tag(id, "Neutral")) + 
           content_tag(:td, radio_button_tag(id, "Agree")) + 
           content_tag(:td, radio_button_tag(id, "Strongly Agree")) + 
           content_tag(:td, radio_button_tag(id, "N/A"))
         end
       end
    when FeedbackQuestion::QuestionType.radio_buttons
      i = 0
      content_tag :div, class: "feedback_question_radio_buttons" do
        safe_join(question.possible_answers_array.map do |answer|
          i += 1
          content_tag :div do
            radio_button_tag(id, answer, id: id) + 
            label_tag("#{id}_#{i}", answer, style: "display:inline")
          end
        end)
      end
    end

  end
end
