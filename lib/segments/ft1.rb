module HL7
  class Message::Segment::FT1 < HL7::Message::Segment
    weight 10
    add_field :set_id
    add_field :date_of_service, idx:4 do |value|
      convert_to_ts(value)
    end
    add_field :transaction_posting_date , idx:5 do |value|
      convert_to_ts(value)
    end
    add_field :transaction_type, idx: 6
    add_field :transaction_code, idx: 7
    add_field :transaction_description, idx: 8
    add_field :transaction_quantity, idx: 10
    add_field :fees_schedule, idx: 17

    # https://www.findacode.com/icd-9/icd-9-cm-diagnosis-codes.html
    # http://www.icd10data.com/ICD10CM/Codes
    add_field :diagnosis_code, idx: 19

    # https://en.wikipedia.org/wiki/National_Provider_Identifier
    add_field :performed_by_provider, idx: 20
    add_field :ordering_provider, idx: 21
    
    # https://en.wikipedia.org/wiki/Current_Procedural_Terminology (CPT)
    add_field :procedure_code, idx: 25
  end
end