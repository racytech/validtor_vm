
import yaml
import os

dirname = os.path.dirname(__file__)
filename = os.path.join(dirname, 'assigned_data/validator_definitions.yml')

def add_validator_secret(filename: str):
    with open(filename, "r") as stream:
        try:
            d = yaml.safe_load(stream)
            for item in d:
                secret_file = os.path.join(dirname, f"assigned_data/secrets/{item['voting_public_key']}")
                item['voting_keystore_password_path'] = secret_file
                    # print(s.readline())
        except yaml.YAMLError as exc:
            print(exc)

    print(d)

    with open(filename, "w") as stream:
        try:
            yaml.dump(d, sort_keys=True, stream=stream)
        except yaml.YAMLError as exc:
            print(exc)

add_validator_secret("/home/racytech/.lighthouse/sepolia/validators/validator_definitions.yml")