.. _library:

************
Code library
************


The directory *src/library* provides code that may be used by different steps of the analysis. Little code snippets for input / output or stuff that is not directly related to the model would go here.

The distinction to the *model_code* directory is a bit arbitrary, but I have found it useful in the past.


.. _project_paths:

Project paths
=============

A variety of project paths are defined in the top-level wscript file. These are exported to be used in header files in other languages. So in case you require different paths (e.g. if you have many different datasets, you may want to have one path to each of them), adjust them in the top-level wscript file.

The following is taken from the top-level wscript file. Modify any project-wide path settings there.

.. literalinclude:: ../../wscript
    :start-after: out = 'bld'
    :end-before:     # Convert the directories into Waf nodes

As should be evident from the similarity of the names, the paths follow the steps of the analysis in the :file:`src` directory:

    1. **data_management** → **OUT_DATA**
    2. **analysis** → **OUT_ANALYSIS**
    3. **final** → **OUT_FINAL**, **OUT_FIGURES**, **OUT_TABLES**

These will re-appear in automatically generated header files by calling the ``write_project_paths`` task generator (just use an output file with the correct extension for the language you need -- ``.py``, ``.r``, ``.m``, ``.do``)


.. _stata_packages:

Stata packages
==============

Note that when you include (or input) the file ``project_paths.do`` in your Stata script, the system directories get changed. **This means that Stata will not find any packages you installed system-wide anymore.** This is desired behaviour to ensure that you (and your coauthors) run the same versions of different packages that you installed via ``ssc`` or the like. The project template comes with a few of them, see *src/library/stata/ado_ext*.


Adding additional packages to a project
----------------------------------------

#. Open a Stata command line session and change to the project root directory
#. Type ``include bld/src/library/stata/project_paths``
#. Type ``sysdir`` and make sure that the ``PLUS`` and ``PERSONAL`` directories point to subdirectories of the project.
#. Install your package via ssc, say ``ssc install tabout``
