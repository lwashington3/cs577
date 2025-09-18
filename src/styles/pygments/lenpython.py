from pygments.style import Style
from pygments.token import Keyword, Name, Comment, String, Error, Number, Operator, Generic, Whitespace

__all__ = ['LenpythonStyle']


class LenpythonStyle(Style):
	"""
	A custom colorful style, inspired by the terminal highlighting style.
	"""

	name = "lenpython"

	background_color = '#f0f3f3'

	styles = {
		Whitespace:        '#bbbbbb',
		Comment:           'italic #8c8c8c',
		Comment.Preproc:   'noitalic #009999',
		Comment.Special:   'bold',

		Keyword:			'bold #CF8E6D',
		Keyword.Pseudo:		'nobold',
		Keyword.Type:		'#007788',

		Operator:			'#555555',
		Operator.Word:		'bold #000000',

		Name:				'#800080',
		Name.Builtin:		'#336666',
		Name.Function:		'#56A8F5',
		Name.Class:			'bold #00AA88',
		Name.Namespace:		'bold #00CCFF',
		Name.Exception:		'bold #CC0000',
		Name.Variable:		'#003333',
		Name.Constant:		'#336600',
		Name.Label:			'#9999FF',
		Name.Entity:		'bold #999999',
		Name.Attribute:	 '#330099',
		Name.Tag:		   'bold #330099',
		Name.Decorator:	 '#9999FF',

		String:			 '#067D17',
		String.Doc:		 'italic #5F826B',
		String.Interpol:	'#AA0000',
		String.Escape:	  'bold #CC3300',
		String.Regex:	   '#33AAAA',
		String.Symbol:	  '#FFCC33',
		String.Other:	   '#CC3300',

		Number:			 '#1750EB',

		Generic.Heading:	'bold #003300',
		Generic.Subheading: 'bold #003300',
		Generic.Deleted:	'border:#CC0000 bg:#FFCCCC',
		Generic.Inserted:   'border:#00CC00 bg:#CCFFCC',
		Generic.Error:	  '#FF0000',
		Generic.Emph:	   'italic',
		Generic.Strong:	 'bold',
		Generic.Prompt:	 'bold #000099',
		Generic.Output:	 '#AAAAAA',
		Generic.Traceback:  '#99CC66',

		Error:			  'bg:#FFAAAA #AA0000'
	}
