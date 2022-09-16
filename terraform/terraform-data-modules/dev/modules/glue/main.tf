
resource "aws_glue_catalog_database" "aws_glue_catalog_database" {
  name = "database"
  #location_uri = "s3://bucket-353006047186/database/raw/"
  location_uri = format("s3://%s/%s", var.s3_bucket_name, substr(var.s3_database_key, 0, 12))
}

resource "aws_glue_catalog_table" "aws_glue_catalog_table" {
  name          = "table"
  database_name = aws_glue_catalog_database.aws_glue_catalog_database.name

  partition_keys {
    name = "id"
    type = "bigint"
  }

  storage_descriptor {
    location = format("s3://%s/%s", var.s3_bucket_name, var.s3_database_key)

    columns {
      name = "petal_length"
      type = "double"
    }

    columns {
      name = "petal_width"
      type = "double"
    }

    columns {
      name = "sepal_length"
      type = "double"
    }

    columns {
      name = "sepal_width"
      type = "double"
    }

    columns {
      name = "variety"
      type = "string"
    }
  }
}
