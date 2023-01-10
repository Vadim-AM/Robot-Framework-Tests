import random

from faker import Faker


class Data:
    fake = Faker()

    def user_name(self):
        return self.fake.name()

    @staticmethod
    def user_age():
        return random.randint(0, 120)

    def user_email(self):
        return self.fake.email()

    def user_address(self):
        return self.fake.address()

    def user_current_address(self):
        return self.fake.address()

    def user_department(self):
        return self.fake.job()