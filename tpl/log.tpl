[% INCLUDE header.tpl %]
    <div id="main">
	<div id="overview">
		[% "Search:" | l10n %]
		<form name="search" method="GET" action="[% base_url %]">
		<input type="hidden" name="rm" value="log" />
		<input type="textbox" name="search" size="20" value="[% search %]" />
		</form>
	</div>
		[% FOREACH line IN log %]
		[% IF loop.first %]
		[% INCLUDE "page-navigation.tpl" %]
		<table class="hilight">
			<thead>
			<tr>
				<th>[% "Date" | l10n %]</th>
				<th>[% "Message" | l10n %]</th>
			</tr>
			</thead>
			<tbody>
		[% END %]
			<tr>
				<td>
					[% line.ts %]
				</td>
				<td>
					[% line.msg | highlight(search) %]
				</td>
			</tr>
		[% IF loop.last %]
		</tbody>
		<tfoot>
		</tfoot>
		</table>
		[% INCLUDE "page-navigation.tpl" %]
		[% END %]
		[% END %]
    </div>
[% INCLUDE footer.tpl %]
