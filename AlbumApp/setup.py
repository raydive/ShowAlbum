import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, 'README.md')).read()

requires = ['pyramid', 'WebError', 'pymongo']

setup(name='AlbumApp',
      version='0.1',
      description='AlbumApp',
      long_description=README,
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pylons",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author="raydive",
      author_email='raywassmas@gmail.com',
      url='https://github.com/raydive',
      keywords='web pyramid pylons mongodb',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires,
      tests_require=requires,
      test_suite="albumapp",
      entry_points = """\
      [paste.app_factory]
      main = albumapp:main
      """,
      paster_plugins=['pyramid'],
      )

