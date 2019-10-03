from marshmallow import Schema, fields

class AdventureSchema(Schema):
  id = fields.Int(required=True)
  user_id = fields.Email(required=True)
  name = fields.Str(required=True)
  description = fields.Str()