from faker import Faker

fake = Faker()


class Data:

    @staticmethod
    def user_name():
        return fake.name()

    @staticmethod
    def user_email():
        return fake.email()

    @staticmethod
    def user_address():
        return fake.address()

    @staticmethod
    def user_current_address():
        return fake.address()
