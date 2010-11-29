class HL7::Message::Segment::SFT < HL7::Message::Segment
  weight 0
  # The sample SFT segments seem to have Set ID before SFT-1, software
  # vendor organization.  This is sensible, since each software
  # component that retransmits a message is supposed to add its own SFT
  # segment.  A Set ID is required to distinguish among multiple SFT
  # segments.
  add_field :set_id
  add_field :software_vendor_organization
  add_field :software_certified_version_or_release_number # NEW longest method name ever.
  add_field :software_product_name
  add_field :software_binary_id
  add_field :software_product_information
  add_field :software_install_date
end
