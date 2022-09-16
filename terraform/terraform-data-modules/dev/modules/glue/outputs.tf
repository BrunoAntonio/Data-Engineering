output "glue_database_name" {
  description = "Name of the Glue database"
  value       = aws_glue_catalog_database.aws_glue_catalog_database.name
}

output "glue_table_name" {
  description = "Name of the Glue table"
  value       = aws_glue_catalog_table.aws_glue_catalog_table.name
}
