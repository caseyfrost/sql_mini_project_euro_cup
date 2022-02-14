import pandas as pd
import os


csv_dir = r'/Users/caseyfrost/Desktop/Springboard/sql_mini_project_euro_cup/data_linux_macos'
fixed = r'/Users/caseyfrost/Desktop/Springboard/sql_mini_project_euro_cup/fixed_data'


def get_file(directory):
    """Returns a list of the files in a directory"""
    files = []
    for filename in os.listdir(directory):
        f = os.path.join(directory, filename)
        # checking if it is a file
        if os.path.isfile(f) and os.path.splitext(f)[1] == '.csv':
            files.append(f)
    return files


def create_list_of_dfs_and_file_names(files):
    df_list = []
    for file in files:
        file_name = os.path.basename(file)
        df = pd.read_csv(file)
        df_list.append((df, file_name))
    return df_list


def is_not_ascii(string):
    if type(string) == str:
        return ''.join([" " if ord(i) >= 128 else i for i in x])
    else:
        return string


def clean_ascii_above_128(dataframe):
    for col in dataframe.columns:
        if dataframe[col].dtypes == 'object':
            dataframe[col] = dataframe[col].apply(lambda x: ''.join([" " if ord(i) >= 128 else i for i in str(x)]))


csvs = get_file(csv_dir)
df_filename = create_list_of_dfs_and_file_names(csvs)
for df, filename in df_filename:
    print(filename + '\n----------')
    clean_ascii_above_128(df)
    df.to_csv(os.path.join(fixed, filename), encoding='utf-8', index=False)
