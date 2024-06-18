import csv

def load_csv_to_db(table_name, csv_file_path):
    connection = connect_to_rds()
    cursor = connection.cursor()

    with open(csv_file_path, 'r') as file:
        csv_data = csv.reader(file)
        next(csv_data)  # Skip the header row
        for row in csv_data:
            placeholders = ', '.join(['%s'] * len(row))
            sql = f"INSERT INTO {table_name} VALUES ({placeholders})"
            cursor.execute(sql, tuple(row))
    
    connection.commit()
    cursor.close()
    connection.close()
    print(f"Data loaded into {table_name} from {csv_file_path}")

if __name__ == "__main__":
    load_csv_to_db('Product', 'sample_data/sample_product.csv')
    load_csv_to_db('Group', 'sample_data/sample_group.csv')
    load_csv_to_db('Delivery', 'sample_data/sample_delivery.csv')
    load_csv_to_db('Branch', 'sample_data/sample_branch.csv')
    load_csv_to_db('Warehouse', 'sample_data/sample_warehouse.csv')
    load_csv_to_db('Customer', 'sample_data/sample_customer.csv')
    load_csv_to_db('Order', 'sample_data/sample_order.csv')
    load_csv_to_db('Employee', 'sample_data/sample_employee.csv')
    load_csv_to_db('Shipping', 'sample_data/sample_shipping.csv')
