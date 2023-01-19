import os
import shutil
from distutils.dir_util import copy_tree

from setuptools import find_packages, setup

# global variables
package_name = 'rfsoc_radio'
pip_name = 'rfsoc-radio'
board = os.environ['BOARD']
repo_board_folder = f'boards/{board}/{package_name}'
board_notebooks_dir = os.environ['PYNQ_JUPYTER_NOTEBOOKS']
board_project_dir = os.path.join(board_notebooks_dir, 'rfsoc-studio', 'radio-demonstrator')

data_files = []

# check whether board is supported
def check_env():
    if not os.path.isdir(repo_board_folder):
        raise ValueError("Board {} is not supported.".format(board))
    if not os.path.isdir(board_notebooks_dir):
        raise ValueError(
            "Directory {} does not exist.".format(board_notebooks_dir))

# copy overlays to python package
def copy_overlays():
    src_ol_dir = os.path.join(repo_board_folder, 'bitstream')
    dst_ol_dir = os.path.join(package_name, 'bitstream')
    copy_tree(src_ol_dir, dst_ol_dir)
    data_files.extend(
        [os.path.join("..", dst_ol_dir, f) for f in os.listdir(dst_ol_dir)])

# copy notebooks to jupyter home
def copy_notebooks():
    src_nb_dir = os.path.join(repo_board_folder, 'notebooks')
    dst_nb_dir = os.path.join(board_project_dir)
    if os.path.exists(dst_nb_dir):
        shutil.rmtree(dst_nb_dir)
    copy_tree(src_nb_dir, dst_nb_dir)

def copy_common_images():
    src_cm_dir = os.path.join(f'boards/common/', 'images')
    dst_cm_dir = os.path.join(board_project_dir, 'images')
    copy_tree(src_cm_dir, dst_cm_dir)

def copy_common_notebooks():
    src_cm_dir = os.path.join(f'boards/common/', 'notebooks')
    dst_cm_dir = os.path.join(board_project_dir)
    copy_tree(src_cm_dir, dst_cm_dir)

# copy xrfclk file to python package (gen3 devices only)
def copy_xrfclk():
    src_at_dir = os.path.join(repo_board_folder, 'xrfclk')
    if os.path.exists(src_at_dir):
        dst_at_dir = os.path.join('xrfclk')
        copy_tree(src_at_dir, dst_at_dir)
        data_files.extend(
            [os.path.join("..", dst_at_dir, f) for f in os.listdir(dst_at_dir)])

check_env()
copy_overlays()
copy_notebooks()
copy_common_images()
copy_common_notebooks()
copy_xrfclk()

setup(
    name="rfsoc_radio",
    version='0.3.1',
    install_requires=[
        'pynq==2.7',
    ],
    url='https://github.com/strath-sdr/rfsoc_radio.git',
    license='BSD 3-Clause License',
    author="David Northcote",
    author_email="david.northcote@strath.ac.uk",
    packages=find_packages(),
    package_data={
        '': data_files,
    },
    description="PYNQ example of using the RFSoC as a radio transceiver.")
