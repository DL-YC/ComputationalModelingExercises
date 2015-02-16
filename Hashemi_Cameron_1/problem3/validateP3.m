function success = validateP3()

success = 1;

%% Check truthTables

fprintf('Checking `productionSystems`... ');

answers = productionSystemsUpdated();
fields = fieldnames(answers);

if numel(fields) ~= 16;
    error('unexpected number of answers (there should be 16)');
    success = 0;
end

for i=1:numel(fields)
  ans = answers.(fields{i});
  if isempty(ans);
      error('invalid answer for %s', fields{i});
      success = 0;
  end
end

fprintf('OK\n');

%% Print out success/failure

if success;
    fprintf('Hooray, your answers passed the validation script!\n')
end

end
