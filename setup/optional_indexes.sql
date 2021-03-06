use [rft]
go

SET ANSI_PADDING ON
go

CREATE NONCLUSTERED INDEX [idx_translations_search] ON [dbo].[Translations]
(
	[Culture] ASC,
	[FK_BranchId] ASC,
	[FK_ResourceFileId] ASC,
	[ResourceIdentifier] ASC
)
INCLUDE ([Id],
	[OriginalResxValueAtTranslation],
	[OriginalResxValueChangedSinceTranslation],
	[TranslatedValue],
	[LastUpdated],
	[LastUpdatedBy]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go


CREATE NONCLUSTERED INDEX [idx_resourcestrings_search] ON [dbo].[ResourceStrings]
(
	[FK_BranchId] ASC,
	[FK_ResourceFileId] ASC,
	[ResourceIdentifier] ASC,
	[Id] ASC
)
INCLUDE ([ResxValue],
	[ResxComment],
	[LastUpdatedFromRepository]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go
