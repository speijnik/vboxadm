[% INCLUDE header.tpl %]
    <div id="main">
	    <div id="overview">
			[% "Search:" | l10n %]
			<form name="search" method="GET" action="vboxadm.pl">
			<input type="hidden" name="rm" value="awl" />
			<input type="textbox" name="search" size="20" value="[% search %]" />
			</form>
		</div>
		[% FOREACH line IN awl %]
		[% IF loop.first %]
		<table class="sortable hilight">
			<thead>
			<tr>
				<th>[% "Email" | l10n %]</th>
				<th>[% "Last Seen" | l10n %]</th>
				<th>[% "Disable" | l10n %]</th>
				<th></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
		[% END %]
			<tr>
				<td>
					[% line.email | highlight(search) %]
				</td>
				<td>
					[% line.last_seen %]
				</td>
				<td>
					[% IF line.disabled %]
					<a onClick="if(confirm('[% "Do you really want to enable the Entry [_1]?" | l10n(line.email) %]')) return true; else return false;" href="vboxadm.pl?rm=update_awl&entry_id=[% line.id %]&disabled=0">[% "enable" | l10n %]</a>
					[% ELSE %]
					<a onClick="if(confirm('[% "Do you really want to disable the Entry [_1]?" | l10n(line.email) %]')) return true; else return false;" href="vboxadm.pl?rm=update_awl&entry_id=[% line.id %]&disabled=1">[% "disable" | l10n %]</a>
					[% END %]
				</td>
			</tr>
		[% IF loop.last %]
		</tbody>
		<tfoot>
		</tfoot>
		</table>
		[% END %]
		[% END %]
    </div>
[% INCLUDE footer.tpl %]
