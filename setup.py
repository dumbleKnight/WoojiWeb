from setuptools import find_packages, setup


def find_requirements():
    with open('requirements.txt') as f:
        requirements = f.read().splitlines()
    return requirements


args = dict(
    name="WoojiCap-Web",
    version="0.0.1",
    description="Web development for WoojiCap",
    packages=find_packages(),
    python_requires=">=3.6",
    install_requires=find_requirements(),
)

setup(**args)
