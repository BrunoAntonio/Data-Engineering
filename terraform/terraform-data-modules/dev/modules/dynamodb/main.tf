resource "aws_dynamodb_table" "dynamodb" {
  name           = "dynamodb-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = "1"
  write_capacity = "1"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"
  }

}

resource "aws_dynamodb_table_item" "dynamodb-item" {
  table_name = aws_dynamodb_table.dynamodb.name
  hash_key   = aws_dynamodb_table.dynamodb.hash_key

  item = <<ITEM
{
  "id": {"N": "1"},
  "petal_length": {"N": "1.6"},
  "petal_width": {"N": "0.2"},
  "sepal_length": {"N": "5.1"},
  "sepal_width": {"N": "3.8"},
  "variety": {"S": "Setosa"}
}
ITEM
}
