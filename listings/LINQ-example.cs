      public class Example{
    public async Task<ClientiDTO?> GetCustomerDetailsById(int customerId,
        CancellationToken cancellationToken = default)
    {
        // Check if the user has permission to read ClientiDTO
                await _permissionTable.TryGetTablePermission(typeof(ClientiDTO), TypeOfOperation.READ,
            _utils.GetCurrentUserRoleId()).ConfigureAwait(false);
            
        Clienti? customerDetails = await _db.Clientis
            .Where(c => c.CliId == customerId)
            .Include(c => c.ClientiDestinazionis.Where(cd => cd.Deleted == false))
            .ThenInclude(d => d.CdeNazioneNavigation)
            .Include(c => c.ClientiDestinazionis.Where(cd => cd.Deleted == false))
            .ThenInclude(d => d.CdeTipoNavigation)
            .Include(c => c.CliBancaSedeNavigation)
            .Include(c => c.CliRiferimentoEsternoNavigation)
            .Include(c => c.CliRiferimentoInternoNavigation)
            .Include(c => c.CliTipoNavigation)
            .Include(c => c.DocumentiDocUtilizzatoreNavigations.Where(d => d.Deleted == false))
            .Include(c => c.CliCorriereNavigation)
            .Include(c => c.CliImballoNavigation)
            .AsNoTracking()
            .FirstOrDefaultAsync(cancellationToken)
            .ConfigureAwait(false);

// Map the retrieved customer details to a ClientiDTO object and return it
        return _mapper.Map<ClientiDTO?>(customerDetails!);
    }
        }