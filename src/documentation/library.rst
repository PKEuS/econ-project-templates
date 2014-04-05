.. _library:

************
Code library
************


The directory *src/library* provides code that may be used by different steps of the analysis. Little code snippets for input / output or stuff that is not directly related to the model would go here.

The distinction to the *model_code* directory is a bit arbitrary, but I have found it useful in the past.


.. _stata_packages:

Stata packages
==============

Note that when you include (or input) the file ``project_paths.do`` in your Stata script, the system directories get changed. **This means that Stata will not find any packages you installed system-wide anymore.** This is desired behaviour to ensure that you (and your coauthors) run the same versions of different packages that you installed via ``ssc`` or the like. The project template comes with a few of them, see *src/library/stata/ado_ext*.


Adding additional Stata packages to a project
---------------------------------------------

#. Open a Stata command line session and change to the project root directory
#. Type ``include bld/src/library/stata/project_paths``
#. Type ``sysdir`` and make sure that the ``PLUS`` and ``PERSONAL`` directories point to subdirectories of the project.
#. Install your package via ssc, say ``ssc install tabout``
